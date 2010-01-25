#!/usr/bin/env python

import sys
import os
import difflib
import filecmp
import getopt
import datetime
import shutil

def load_index():
    files_dict = {}

    f = open("index", 'r')
    for line in f:
        here, there = line.split(" ")
        files_dict[here] = os.path.expanduser(there[:-1])

    return files_dict

def do_backup(args):
    backup_dir = BACKUP_DIR
    quiet = False

    try:
        opts, argsv = getopt.getopt(args, "d:q")
    except getopt.GetoptError, err:
        print str(err)
        sys.exit(2)

    for o, a in opts:
        if o == "-d":
            backup_dir = a
        if o == "-q":
            quiet = True
   
    log = {True: lambda msg: None, False: lambda msg: sys.stdout.write(msg)}[quiet]

    backup_dir = os.path.expanduser(backup_dir)
    backup_dest = os.path.join(backup_dir, 
            datetime.datetime.now().strftime("%Y%m%d%H%M%S"))

    if not os.path.isdir(backup_dest):
        os.makedirs(backup_dest)

    files_to_backup = load_index().values()

    for file in files_to_backup:
        file_dest = os.path.join(backup_dest, os.path.basename(file))
        log("%s --> %s\n" % (file, file_dest)) 

        if os.path.isdir(file):
            shutil.copytree(file, file_dest)
        else:
            shutil.copyfile(file, file_dest)

def do_install(args):
    def process_file(here, there):
        if filecmp.cmp(here, there) is True:
            print "%s and %s seem equal" % (here, there)
        else:
            print "%s and %s are not equal" % (here, there)
            os.system("diff -u %s %s|less -E" % (there, here))


            prompt = """\n\nActions:
1) replace local file
2) replace repo file
3) show diff
4) skip\n\naction: """

            user_command = -1

            while user_command not in (1, 2, 4):
                if user_command == 3:
                    os.system("diff -u %s %s|less -E" % (there, here))

                user_command = int(raw_input(prompt))

            if user_command == 4:
                print "Skipping..."
            elif user_command == 1:
                sys.stdout.write("\n%s --> %s\n\n" % (here, there))
                shutil.copyfile(here, there)
            elif user_command == 2:
                sys.stdout.write("\n%s --> %s\n\n" % (there, here))
                shutil.copyfile(there, here)
            return

    files = load_index()

    for here, there in files.iteritems():
        if os.path.isfile(here):
            process_file(here, there)

ACTIONS = {"install": do_install,
        "backup": do_backup}
BACKUP_DIR = "~/.dotfilesbak"

def usage():
    sys.stdout.write("usage: %s command [args]\n\n")

if __name__ == "__main__":
    if len(sys.argv) <= 1:
        usage()
        sys.exit(1)

    action = sys.argv[1]

    if action not in ACTIONS:
        sys.stderr.write("'%s' is not a valid action!\n" % action)
        sys.exit(1)
    else:
        ACTIONS[action](sys.argv[2:])
