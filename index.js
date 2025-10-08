import { watch } from "fs";
import { exec } from "child_process";

// Folder to watch (recursively)
const WATCH_DIR = "."; // change to your target folder
// Shell script to run
const SCRIPT = "sh build.sh"; // change to your script path

console.log(`Watching for file changes in ${WATCH_DIR}...`);

var last = null;
const watcher = watch(WATCH_DIR, { recursive: true }, (eventType, filename) => {
    if (last != filename) {
        last = filename;
        return;
    }
    if (filename && filename.endsWith(".typ")) {
        console.log(`[${new Date().toLocaleTimeString()}] ${eventType}: ${filename}`);
        exec(SCRIPT, (error, stdout, stderr) => {
            if (error) {
                console.error(`Error executing script: ${error.message}`);
                return;
            }
            if (stdout) console.log(stdout.trim());
            if (stderr) console.error(stderr.trim());
        });
    }
});

// Optional: handle exit signals gracefully
process.on("SIGINT", () => {
    watcher.close();
    console.log("\nStopped watching.");
    process.exit(0);
});
