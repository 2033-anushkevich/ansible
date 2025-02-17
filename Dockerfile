FROM ubuntu:24.04

RUN apt-get update && apt-get install -y openssh-server sudo python3 python3-pip python3.12-venv nginx curl git gnupg supervisor --no-install-recommends

COPY . /app
WORKDIR /app


COPY supervisord.conf /etc/supervisor/conf.d/

RUN cp context/nginx.conf /etc/nginx/sites-available/default

RUN useradd -m -s /bin/bash ansibleuser
RUN adduser ansibleuser sudo
RUN echo 'ansibleuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir /var/run/sshd
COPY context/id_rsa.pub /home/ansibleuser/.ssh/authorized_keys
RUN chmod 600 /home/ansibleuser/.ssh/authorized_keys
RUN chmod 700 /home/ansibleuser/.ssh
RUN chown -R ansibleuser:ansibleuser /home/ansibleuser/.ssh


RUN python3 -m venv .venv
ENV PATH="/app/.venv/bin:$PATH"
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get autoremove -y && apt-get clean -y

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
