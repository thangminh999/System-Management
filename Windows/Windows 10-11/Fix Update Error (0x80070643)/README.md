<h1>Solution: Resize the partition manually</h1>
<hr>

<h2>Instruct:</h2>
<div>
<h3>1. Open a Command Prompt ( cmd ) window as administrator.</h3>
<ul><li>![image](https://github.com/thangminh999/System-Management/assets/79648170/0d821d52-19cd-41a4-b9b0-93888f40da0d)</li></ul>
</div>

<div>
<p>2. To check WinRE status, run reagentc /info .</p> 
<span>If WinRE is installed, there will be a “Windows RE location” with the path to the WinRE folder. An example is: “Windows RE location: [file://%3f/GLOBALROOT/device/harddisk0/partition4/Recovery/WindowsRE]\?\GLOBALROOT\device\harddisk0\partition4\Recovery\WindowsRE.” Here, the number after “hard drive” and “disk partition” is the index of the disk and partition WinRE is on.</span>
<ul><li>![image](https://github.com/thangminh999/System-Management/assets/79648170/9a7c3278-3554-4a65-a2de-7771c4c30dae)</li></ul>
</div>

<div>
<p>3. To disable WinRE, run reagentc /disable</p>
<ul><li>![image](https://github.com/thangminh999/System-Management/assets/79648170/ea935801-562d-4df8-a0a7-756ba13635a0)</li></ul>
</div>

<div>
<p>4. Shrink the operating system partition and prepare the disk for the new recovery partition.</p>
<ul>
  <li>To shrink the OS, run diskpart<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/14468885-1d59-4802-a633-5af6c56bf432)</li>
  <li>.Run list disk<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/7f38d0bd-04b3-4d65-959a-c22f071dfda5)</li>
  <li>To select the OS disk, run sel disk<OS disk index> This disk must be the same disk index as WinRE.<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/1eb9571b-3c06-450e-9448-6a7a878ac5db)</li>
  <li>To check the partition in the OS disk and find the OS partition, run partition list part<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/643bc346-b070-4771-93d1-403e1001db36)</li>
  <li>To select the OS partition, run sel part <OS partition index><br>![image](https://github.com/thangminh999/System-Management/assets/79648170/09d5bf66-b8da-44bc-bdcd-0578f81b5fc1)</li>
  <li>Cmd: shrink desired=250 minimum=250<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/212a5cf8-4059-4577-b341-e357d7f2cedd)</li>
  <li>To select the WinRE partition, run sel part <WinRE partition index><br>![image](https://github.com/thangminh999/System-Management/assets/79648170/2353e3bf-36bb-4037-9753-15dd15bba742)</li>
  <li>To delete the WinRE partition, cmd: delete partition override<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/7f77ef37-dbb8-4300-8a66-c1464475ddbf)</li>
</ul>
</div>
<div>
  <p>5. Create a new recovery partition.</p>
  <span>First, check whether the drive partition type is GUID Partition Table (GPT) or Master Boot Record (MBR). To do that, run list disk . Check if there is an asterisk character (*) in the “Gpt” column. If there is an asterisk (*), the drive is GPT. Otherwise, the drive is MBR.</span>
  <ul>
    <li>If your disk is GPT, run create partition primary id=de94bba4-06d1-4d40-a16a-bfd50179d6ac followed by the command gpt attributes =0x8000000000000001<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/dd83478b-d804-4b92-b18a-654ddaf390d8)</li>
    <li>If your disk is MBR, cmd: create partition primary id=27</li>
    <li>To format the partition, run format quick fs=ntfs label=”Windows RE tools”, Exit<br>![image](https://github.com/thangminh999/System-Management/assets/79648170/f0b963f8-a12d-4a19-8d5b-b8b6a3354b73)</li>
  </ul>
</div>
    
<div>
  <p>8. To re-enable WinRE, cmd: reagentc /enable</p>
  <ul>
    <li>![image](https://github.com/thangminh999/System-Management/assets/79648170/78c2a48a-0a52-4b81-94b9-7fb70e347ecf)</li>
  </ul>
</div>

<div>
  <p>9. To confirm where WinRE is installed, cmd: reagentc /info</p>
  <ul>
    <li>![image](https://github.com/thangminh999/System-Management/assets/79648170/4d32423c-abdb-4ffd-8ba3-40572e984822)</li>
  </ul>
</div>

<div>
  <p>10. Check for updates.</p>
  <ul><li>![image](https://github.com/thangminh999/System-Management/assets/79648170/4425992c-574a-4984-8150-f16300108d03)</li></ul>
</div>

