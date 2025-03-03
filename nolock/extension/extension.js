const St = imports.gi.St;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;

const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();
const Main = imports.ui.main;
const Mainloop = imports.mainloop;
const PanelMenu = imports.ui.panelMenu;

let debounceTimeout = null;

class Extension {
    constructor() {
        this._indicator = null;
    }
    
    enable() {
        log(`enabling ${Me.metadata.name}`);

        let indicatorName = `${Me.metadata.name} Indicator`;
        
        // Create a panel button
        this._indicator = new PanelMenu.Button(0.0, indicatorName, false);
        
        // Add an icon
        let icon = new St.Icon({
            gicon: new Gio.ThemedIcon({name: 'system-lock-screen-symbolic'}),
            style_class: 'system-status-icon'
        });
        this._indicator.add_child(icon);
	this._indicator.connect('button-press-event', _lock);

        // `Main.panel` is the actual panel you see at the top of the screen,
        // not a class constructor.
        Main.panel.addToStatusArea(indicatorName, this._indicator);
    }
    
    // REMINDER: It's required for extensions to clean up after themselves when
    // they are disabled. This is required for approval during review!
    disable() {
        log(`disabling ${Me.metadata.name}`);

        this._indicator.destroy();
        this._indicator = null;
    }
}

function _lock() {
	Gio.Subprocess.new(['pactl', 'set-sink-mute', '@DEFAULT_SINK@', 'false'], 0);
	Gio.Subprocess.new(['pactl', 'set-sink-volume', '@DEFAULT_SINK@', '50%'], 0); 
	Gio.Subprocess.new(['/usr/bin/cvlc', GLib.get_home_dir() + '/.nolock/no.mp4', '-f', '--play-and-exit', '--video-on-top', '--norepeat', '--no-video-title-show'], 0);
    //Gio.Subprocess.new(['/usr/bin/notify-send', "Flemme gros", "bosse un peu nan ? Moi j'ai la flemme perso", "-u", "critical"], 0);
}

function init() {
    log(`initializing ${Me.metadata.name}`);
    
    return new Extension();
}
