 <div class="row">
    <div class="col-lg-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <i class="fa fa-question fa-fw"></i> Getting Started Guide
            </div>
            <div class="panel-body">
                <p>1. <strong>Create account.</strong></p>
                <ul>
                    <li>Register <a href="{$smarty.server.SCRIPT_NAME}?page=register">here</a>, or login if you already have account</li>
                    <li>Create a <a href="{$smarty.server.SCRIPT_NAME}?page=account&action=workers">worker</a> that will be used by the miner to login</li>
                </ul>
                <p>2. <strong>Download a miner.</strong></p>
                <ul>
                    <li><em>veriumMiner (github):</em><a href="https://github.com/tpruvot/cpuminer-multi" target="_blank"> Download here</a>.</li>
                    <li><em>veriumMiner (Windows):</em><a href="https://github.com/tpruvot/cpuminer-multi/releases" target="_blank"> Download here</a>.</li>
                </ul>
                </li>
                <p>3. <strong>Configure your miner.</strong></p>
                <ul>
                <li>cpuminer-multi <em>(Linux)</em></li>
                <pre>./cpuminer-multi -a scrypt:1048576 -o stratum+tcp://{$SITESTRATUMURL|default:$smarty.server.SERVER_NAME}:{$SITESTRATUMPORT|default:"3334"} -O <em>Weblogin</em>.<em>WorkerName</em>:<em>WorkerPassword</em></pre>
                <br />
                <p> If you want to mine on a <strong> Windows Operating System</strong>, then you'll need to create a batch file to start your miner. </p><p> Simply open notepad and then copy and paste the following:</p>
                <li>cpuminer-multi <em>(Windows)</em></li>
                <pre>cpuminer-multi -a scrypt:1048576 -o stratum+tcp://{$SITESTRATUMURL|default:$smarty.server.SERVER_NAME}:{$SITESTRATUMPORT|default:"3334"} -O <em>Weblogin</em>.<em>WorkerName</em>:<em>WorkerPassword</em></pre>
                <p> You then need to change "-u Weblogin.Worker -p Worker password" to reflect your own account. Eg, "-u Steve.StevesWorker -p StevesWorkerPassword" then go to "File > Save as" and save the file as "RunMe.bat" in the same folder containing your miners application files. You are now ready to mine, double click on "RunMe.bat" to start mining. If you want, you can create additional workers with usernames and passwords of your choice <a href="{$smarty.server.SCRIPT_NAME}?page=account&action=workers">here</a></p>
                </ul>
                <p>4. <strong>Create a {$SITECOINNAME|default:"Litecoin"} address to receive payments.</strong></p>
                <ul>
                    <li> Downloading the client &amp; block chain:  Download the {$SITECOINNAME|default:"Litecoin"} client from <a href="{$SITECOINURL|default:"http://www.litecoin.org"}" target="_blank">here</a>.
                    <p>Generate a new address and input it on your account page to receive payments.</p>
                    </li>
                </ul>
                    </div>
                </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
