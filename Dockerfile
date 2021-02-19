# Base your contaier on something of use and,
# by convention, launch your run-time logic
# from a 'docker-entrypoint.sh' shell-script.
#
# Remember - regardeless of any user you have avalable at build-time
# the container user ID and group ID will be out of you rcontrol.
# So plan accordingly.

ARG from_image=python:3.9.1
FROM ${from_image}

# All formatter images must place their
# implementations (and start) in /home/formatter
WORKDIR /home/formatter

# Copy-in the entrypoint,
# making sure anyone can read and execute it.
COPY docker-entrypoint.sh ./
RUN chmod a+rx ./*.sh

# Start the application
CMD ./docker-entrypoint.sh
