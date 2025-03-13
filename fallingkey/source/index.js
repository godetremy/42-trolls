const { app, BrowserWindow, screen, ipcMain } = require('electron')
const ioHook = require('iohook');


app.commandLine.appendSwitch('no-sandbox');
app.disableHardwareAcceleration();

let win


const createWindow = () => {
	const { width, height } = screen.getPrimaryDisplay().size;
	win = new BrowserWindow({
		x: 0,
		y: 0,
		width: width,
		height: height,
		titleBarStyle: 'hidden',
		frame: false,
		type: 'dock',
		webPreferences: {
			nodeIntegration: true, // Si nécessaire, pour activer l'intégration Node.js dans le renderer
			contextIsolation: false, // Assurez-vous que le contexte est partagé
		},
		transparent: true,
	})

	win.loadFile('index.html')
	win.setIgnoreMouseEvents(true, { forward: true });
	//win.webContents.openDevTools()
}

ioHook.on('keydown', (event) => {
	win.webContents.send('key', event.keycode);
});

app.on('ready', () => {
  setTimeout(() => {
    createWindow();
  }, 200);
  ioHook.start();
})
