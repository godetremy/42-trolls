import json

#!/usr/bin/env python3
"""
build.py - Build trolls README and scripts.

Usage:
    python build.py
"""

category = {
    "slightly": {
        "title": "🟢 Slightly Annoying",
        "description": "Simple pranks that are easy to undo (like modifying .zshrc)",
    },
    "moderately": {
        "title": "🟡 Moderately Annoying",
        "description": "A step up! These pranks are a bit more troublesome but can be undone with the right know-how 😘",
    },
    "annoying": {
        "title": "🟠 Very Annoying",
        "description": "Ready for more? These pranks involve taking control of hardware features… like sound, graphics, and storage!",
    },
    "ultra": {
        "title": "🔴 Ultra Annoying",
        "description": "The final countdown… Ultra annoying pranks, like session scripts or resets.",
    },
}

def read_trolls_list():
    with open("trolls.json", "r", encoding="utf-8") as f:
        return json.load(f)

def generate_readme(trolls):
    with open("README.md", "w", encoding="utf-8") as f:
        f.write("<h1 align=center>42 Trolls</h1>\n<h3 align=center>Never leave your computer unlocked again. 😈</h3>\n\nWelcome to **42 Trolls**! Here’s the ultimate guide to prank your friends at 42 School.\n\n")

        f.write("We’ve organized the pranks into four categories:\n")
        for level in category.keys():
            f.write(f"- **{category[level]['title']} :** {category[level]['description']}\n")
        f.write("\n")

        for level in category.keys():
            f.write(f"## {category[level]['title']}\n{category[level]['description']}\n\n")

            for troll in trolls[level]:
                f.write(f"### {troll['name']}\n")
                f.write(f"{troll['description']}\n")
                if 'note' in troll:
                     f.write(f">[!NOTE]\n> {troll['note']}\n")
                if 'caution' in troll:
                     f.write(f">[!CAUTION]\n> {troll['caution']}\n")
                f.write("```bash\n")
                f.write(f"{troll['entry']}\n")
                f.write("```\n")
                if 'removal' in troll:
                    f.write("<details>\n  <summary>🧹 How to remove ?</summary>\n\n")
                    f.write(f"{troll['removal']['description']}\n")
                    f.write("```bash\n")
                    f.write(f"{troll['removal']['command']}\n")
                    f.write("```\n</details>\n")
                if 'contribute' in troll:
                    f.write("\n")
                    f.write("<details>\n  <summary>🪄 Want to contribute ?</summary>\n\n")
                    f.write(f"{troll['contribute']}\n")
                    f.write("</details>\n")
                f.write("\n")

def generate_script(trolls):
    with open("launcher.sh", "w", encoding="utf-8") as f:
        f.write("""#!/bin/bash

GUM_VERSION=gum_0.17.0_$(uname -s)_$(uname -m)
GUM_URL="https://github.com/charmbracelet/gum/releases/download/v0.17.0/$GUM_VERSION.tar.gz"
GUM_TMP_PATH=/tmp/gum
GUM_PATH=$GUM_TMP_PATH/$GUM_VERSION
GUM=$GUM_PATH/gum

mkdir -p "$GUM_TMP_PATH"
curl -fsSL "$GUM_URL" -o "$GUM_TMP_PATH/gum.tar.gz"
tar -xzf "$GUM_TMP_PATH/gum.tar.gz" -C "$GUM_TMP_PATH"
chmod +x "$GUM"
""");
        f.write('\ngum_select_category()\n{\n    echo "$($GUM choose \\\n        --header="Category / "');
        for level in category.keys():
            f.write(f" \\\n        \"{category[level]['title']}\"");
        f.write('\n    )"\n}\n')
        for level in category.keys():
            f.write(f"gum_select_{level}()\n")
            f.write('{\n    echo "$($GUM choose \\\n        --header="Category / ')
            f.write(f"{category[level]['title']}\"");
            for troll in trolls[level]:
                f.write(f" \\\n        \"{troll['name']}\"");
            f.write('\n    )"\n}\n\n')
        f.write("select_troll() {\n    TROLL=\"\"\n\n    while [ -z \"$TROLL\" ]; do\n        CATEGORY=\"$(gum_select_category)\"\n\n        if [ -z \"$CATEGORY\" ]; then\n           return\n        fi\n\n");
        for level in category.keys():
            f.write(f"        if [ \"$CATEGORY\" = \"{category[level]['title']}\" ]; then\n            TROLL=\"$(gum_select_{level})\"\n        fi\n\n");
        f.write("    done;\n\n    echo \"$TROLL\"\n}\n\n");

        for level in category.keys():
            for troll in trolls[level]:
                f.write(f"launch_troll_{level}_{troll['id']}()")
                f.write("{\n");
                f.write(f"    if $GUM confirm \"Are you really sure to install {troll['name']}\" </dev/tty; then\n");
                f.write(f"        {troll['entry']}\n")
                f.write("    fi\n")
                f.write("}\n");

        f.write("""
TROLL="$(select_troll </dev/tty)"

""");
        for level in category.keys():
            for troll in trolls[level]:
                f.write(f"if [ \"$TROLL\" = \"{troll['name']}\" ]; then\n    launch_troll_{level}_{troll['id']}\n    exit\nfi\n\n");


def main() -> int:
       trolls = read_trolls_list()
       generate_readme(trolls)
       generate_script(trolls)
       return 0

if __name__ == "__main__":
        raise SystemExit(main())