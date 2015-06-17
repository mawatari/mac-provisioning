import subprocess

class CallbackModule(object):

    def __init__(self):
        """ constructor """

    def on_any(self, *args, **kwargs):
        pass

    def runner_on_failed(self, host, res, ignore_errors=False):
        pass

    def runner_on_ok(self, host, res):
        pass

    def runner_on_skipped(self, host, item=None):
        pass

    def runner_on_unreachable(self, host, res):
        pass

    def runner_on_no_hosts(self):
        pass

    def runner_on_async_poll(self, host, res, jid, clock):
        pass

    def runner_on_async_ok(self, host, res, jid):
        pass

    def runner_on_async_failed(self, host, res, jid):
        pass

    def playbook_on_start(self):
        pass

    def playbook_on_notify(self, host, handler):
        pass

    def playbook_on_no_hosts_matched(self):
        pass

    def playbook_on_no_hosts_remaining(self):
        pass

    def playbook_on_task_start(self, name, is_conditional):
        pass

    def playbook_on_vars_prompt(self, varname, private=True, prompt=None,
                                encrypt=None, confirm=False, salt_size=None,
                                salt=None, default=None):
        pass

    def playbook_on_setup(self):
        pass

    def playbook_on_import_for_host(self, host, imported_file):
        pass

    def playbook_on_not_import_for_host(self, host, missing_file):
        pass

    def playbook_on_play_start(self, name):
        pass

    def playbook_on_stats(self, stats):
        hosts = sorted(stats.processed.keys())

        for host in hosts:
            summary = stats.summarize(host)

            status = "Provisioning succeeded!"
            voice = "-v Zarvox"
            if summary['failures'] > 0 or summary['unreachable'] > 0:
                status = "Provisioning failed!"
                voice = "-v Hysterical ha ha ha,"

            cmd = "osascript -e 'display notification \"{}\" with title \"{}\"'"
            cmd = cmd.format(summary, status)
            subprocess.call(cmd, shell=True)
            subprocess.call("say %s %s" % (voice, status), shell=True)
