#include <stdio.h> //这个不解释

#include <fcntl.h> //System Call open()

#include <string.h> //memset()

#include <linux/input.h> //struct event also include time.h 

#include <errno.h> //errno()

#include <unistd.h> //usleep()

int main(int argc, char *argv[])
{
    int i;
    int fd;
    int ret;
    int version;
    struct input_event event;

    char device[]="_REPLACE_DEVICE_";

    fd = open(device, O_RDWR);
    if(fd < 0) {
        fprintf(stderr, "could not open, %s\n", strerror(errno));
        return 1;
    }
    if (ioctl(fd, EVIOCGVERSION, &version)) {
        fprintf(stderr, "could not get driver version , %s\n", strerror(errno));
        return 1;
    }


    FILE *eventfile;
    if (argc == 2){
        if ((eventfile = fopen(argv[1], "r")) == NULL){
            printf("file open failure \n");
            return -1;
        }
    }
    else if (argc > 2){
        printf("too much argument \n");
        return -1;
    }
    else {
        printf("please add eventfile \n");
        return -1;
    }
    
    int a,b,c,d;
    while (!feof(eventfile)){
        fscanf(eventfile, "%d %d %d %d", &a, &b, &c, &d);
        if (a > 10000)
            usleep(a - 10000);
        else
            usleep(a);
        memset(&event, 0, sizeof(event));
        event.type = b;
        event.code = c;
        event.value = d;
        ret = write(fd, &event, sizeof(event));
        if(ret < sizeof(event)) {
            fprintf(stderr, "write event failed, %s\n", strerror(errno));
            return -1;
        }
    }
    return 0;
}
