#!/bin/bash

ano=`date +%Y`
dia=`date +%d-%m-%Y`
mes=`date +%m-%Y`
hora=`date +%H:%M`

ANO_backup=/home/Backups/backup_$ano
MES_backup=/home/Backups/backup_$mes

VERI_ANO_backup=`ls -l /home/Backups/backup_$ano`
if [ $? = 2 ]; then

mkdir /home/Backups/backup_$ano
echo "Criado diretorio mes backup_$ano"

else
echo "arquivo ja existe"
fi


VERI_MES_backup=`ls -l /home/Backups/backup_$ano/backup_$mes`

if [ $? = 2 ]; then

mkdir /home/Backups/backup_$ano/backup_$mes
echo "Criado diretorio mes backup_$mes"

else
echo "arquivo ja existe"
fi

MES_DIA_backup=/home/Backups/backup_$ano/backup_$dia
VERI_MES_DIA_backup=`ls -l /home/Backups/backup_$ano/backup_$mes/backup_$dia`

if [ $? = 2 ]; then
mkdir /home/Backups/backup_$ano/backup_$mes/backup_$dia
echo "Criado diretorio backup_$dia"

echo "Copia os arquivos"
#copia os arquivos que devem ser feitos backups
cp /etc/asterisk/sip.conf /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/asterisk/extensions_releases.conf /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/asterisk/extensions.conf /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/asterisk/modules.conf /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/crontab /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/motd /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/rc.local /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /home/*.sh /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /home/firewall /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/profile.d/motd.sh /home/Backups/backup_$ano/backup_$mes/backup_$dia
cp /etc/sysconfig/network-scripts/ifcfg-eth0 /home/Backups/backup_$ano/backup_$mes/backup_$dia

tar -cvf /home/Backups/backup_$ano/backup_$mes/backup_$dia.tar.gz /home/Backups/backup_$ano/backup_$mes/backup_$dia

else
echo "arquivo ja existe"

fi


