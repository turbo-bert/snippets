import sublime
import sublime_plugin
import datetime
import subprocess


class TurboBaseCommand(sublime_plugin.TextCommand):

    def run(self, edit):
        for region in self.view.sel():
            self.handle_region(edit, region)

    def handle_region(self, edit, region):
        import base64
        x = self.view.substr(region)
        self.view.replace(edit, region, base64.b64encode(x.encode()).decode())


class TurboUnBaseCommand(sublime_plugin.TextCommand):

    def run(self, edit):
        for region in self.view.sel():
            self.handle_region(edit, region)

    def handle_region(self, edit, region):
        import base64
        x = self.view.substr(region)
        self.view.replace(edit, region, base64.b64decode(x.encode()).decode())


class Time2Command(sublime_plugin.EventListener):

    def on_query_completions(self, view, prefix, locations):
        if prefix == "nnn":
            uuidstring = subprocess.check_output(["uuidgen"], universal_newlines=True).lower().strip().replace("-", "")
            return [(prefix, prefix, "module module_" + uuidstring + "() {\n}\n")]
        timestring = datetime.datetime.now(datetime.timezone.utc).astimezone().isoformat().replace("+", " ").replace(".", " ").split()
        utimestring = datetime.datetime.utcnow().isoformat().split(".")[0] + "+00:00"
        timestring = "%s+%s" % (timestring[0], timestring[2])
        if (prefix == "tz"):
            return [(prefix, prefix, datetime.datetime.now().isoformat().split(".")[0])]
        if (prefix == "t"):
            return [(prefix, prefix, timestring)]
        if (prefix == "ut"):
            return [(prefix, prefix, utimestring)]
        if (prefix == "u"):
            uuidstring = subprocess.check_output(["uuidgen"], universal_newlines=True).lower().strip()
            return [(prefix, prefix, uuidstring)]
        if (prefix == "lines"):
            tmp_str = """with open("", "r") as f:
    lines = f.read().strip().replace("\\r", "").split("\\n")
            """
            return [(prefix, prefix, tmp_str)]
        if (prefix == "U"):
            uuidstring = subprocess.check_output(["uuidgen"], universal_newlines=True)
            return [(prefix, prefix, uuidstring)]
        if (prefix == "h8"):
            uuidstring = subprocess.check_output(["openssl", "rand", "-hex", "4"], universal_newlines=True).lower()
            return [(prefix, prefix, uuidstring)]
        if (prefix == "h32"):
            uuidstring = subprocess.check_output(["openssl", "rand", "-hex", "16"], universal_newlines=True).lower()
            return [(prefix, prefix, uuidstring)]
        if (prefix == "dt"):
            uuidstring = subprocess.check_output(["date", "+%F"], universal_newlines=True).strip()
            return [(prefix, prefix, uuidstring)]
        if (prefix == "mfg"):
            return [(prefix, prefix, "\nMit freundlichen Grüßen\n\n")]
        return []
