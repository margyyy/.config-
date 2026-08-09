#!/usr/bin/env python3

import signal

import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gdk, GLib, Gtk  # noqa: E402


GLib.set_prgname("waybar-calendar")
signal.signal(signal.SIGINT, signal.SIG_DFL)

window = Gtk.Window(title="Calendar")
window.set_name("waybar-calendar")
window.set_wmclass("waybar-calendar", "waybar-calendar")
window.set_decorated(False)
window.set_resizable(False)
window.set_keep_above(True)
window.set_skip_pager_hint(True)
window.set_skip_taskbar_hint(True)
window.set_type_hint(Gdk.WindowTypeHint.UTILITY)
window.set_border_width(10)
window.connect("destroy", Gtk.main_quit)

calendar = Gtk.Calendar()
calendar.set_property("show-heading", True)
calendar.set_property("show-day-names", True)
calendar.set_property("show-week-numbers", True)
window.add(calendar)

css = Gtk.CssProvider()
css.load_from_data(
    b"""
    window#waybar-calendar {
        background: #101010;
        color: #c8c8c8;
        border: 1px solid #505050;
    }
    calendar {
        background: #101010;
        color: #c8c8c8;
        font-family: JetBrainsMono Nerd Font Mono;
        font-size: 12px;
        padding: 6px;
    }
    calendar:selected {
        background: #eeeeee;
        color: #101010;
    }
    """
)
Gtk.StyleContext.add_provider_for_screen(
    Gdk.Screen.get_default(), css, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
)


def on_key_press(_window, event):
    if event.keyval == Gdk.KEY_Escape:
        Gtk.main_quit()
        return True
    return False


window.connect("key-press-event", on_key_press)
window.show_all()
Gtk.main()
