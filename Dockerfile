FROM openresty/openresty:1.21.4.2-0-jammy

RUN opm get bungle/lua-resty-session=3.10
RUN opm get zmartzone/lua-resty-openidc=1.7.5

RUN mkdir /var/log/nginx

RUN mkdir -p /opt/nginx/ssl
# RUN openssl req -nodes -newkey rsa:2048 -keyout /opt/nginx/ssl/private.pem -out /opt/nginx/ssl/certificate.csr -subj "/C=IN/ST=WestBengal/L=Kolkata/O=Red Hat/OU=APS/CN=www.example.com"
# RUN openssl x509 -req -in /opt/nginx/ssl/certificate.csr -out /opt/nginx/ssl/certificate.pem -signkey /opt/nginx/ssl/private.pem

COPY ssl/DigiCertTLSRSA4096RootG5.crt.pem /opt/nginx/ssl/cert.pem
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

