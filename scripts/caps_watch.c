#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/XKBlib.h>

int main(void)
{
    Display *dpy;
    int xkbEventType, xkbError;
    int major = XkbMajorVersion, minor = XkbMinorVersion;

    dpy = XkbOpenDisplay(NULL, &xkbEventType, NULL, &major, &minor, &xkbError);
    if (!dpy)
        return 1;

    XkbSelectEventDetails(dpy, XkbUseCoreKbd, XkbStateNotify,
                          XkbModifierLockMask, XkbModifierLockMask);

    int prev = -1;

    XEvent xev;
    while (1) {
        XNextEvent(dpy, &xev);
        if (xev.type != xkbEventType)
            continue;

        XkbEvent *xkbe = (XkbEvent *)&xev;
        if (xkbe->any.xkb_type != XkbStateNotify)
            continue;

        int on = (xkbe->state.locked_mods & LockMask) != 0;
        if (on == prev)
            continue;
        prev = on;

        char cmd[256];
        snprintf(cmd, sizeof(cmd),
                 "dunstify 'Caps Lock: %s'",
                 on ? "ON" : "OFF");
        system(cmd);
    }
    return 0;
}
