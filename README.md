# The Cost Modeler Tool
A tool to help IT people evaluate the total costs of their Cloud or even their existing infrastructure.

<h3>Introduction</h3>

Any business requires its executives and managers to account for the cost of their portion of the operation. Arguably, and in various ways, all business managers are responsible for consistently managing costs. This is even more keenly required in the Cloud Service Provider(CSP) or Managed Service Provider(MSP) domain.

Why?

As Cloud services becoming ubiquitous in the world of IT those provisioning and delivering these services often need help to reorganise and rethink their cost management capabilities in order to be able to efficiently and effectively understand their cost base in a broader "shared" infrastructure environment where servers, storage, networks and services are being consumed in real-time for hourly periods rather than the historically stable mid to longer term commercial structures. Cloud introduces many challenges for cost control in IT environments, a simple example is the allocation of costs for SAN switches in shared storage environment's.
Cloud Profit Imperative

Profit, equity value, net income or return on investment are all reliant as determinants of a businesses success on the under-pinning components of cost. This MSP Cost Modeller is designed to help new and existing MSPs & CSPs to examine & understand their cost base from the perspective of delivering short term annuity or Cloud contracts. It is not designed as a replacement cost management system, rather, it is a simple tool to help with designing and scenario modelling current and future Cloud Services.
Cost categorisation is generally well understood but often goes unrecorded in small businesses from the outset with cost often seen as equal to expenditure rather than a comprehensive understanding and recording from the outset of all aspects of "outflow" (i.e. cash, payables, rendered services, bartered giveaways, etc.).

With this in mind the tool provides a means to record all costs and to assign them to cost categories from the outset, those being:

<ul>
<li>Fixed Costs - those costs that do not vary with production or service unit volume;</li>
<li>Variable Costs - those costs that do vary with production or service unit volume;</li>
<li>Semi-fixed or Step-Fixed Costs - those costs that do vary at incremental volume levels;</li>
<li>Direct Costs - those costs that are clearly linked to a specific product or service or customer;</li>
<li>Indirect Costs - those costs that cannot be linked to a specific product or service or customer;</li>
</ul>
This tool is designed to help for CIOs, IT Managers and Service Managers in MSPs and CSPs to fundamentally understand, first, their current cost position and then to enable the analysis of scenarios to understand the cost impacts of proposed changes before executing on the project. Above all the tool is designed to help answer those seemingly simple questions:
If we utilise the services of off-shore data centres or resources what is the cost impact (per VM or per TB) of a change in the foreign exchange rate?
What would our costs per customer look like if we charged proportionate to service desk usage?
If we add another devops resource what happens to our cost per VM?
What is the impact on the cost of our service if the underlying Kilo-Watt hour power cost increases by 15%?
If we moved all or components of our services to another provider would this increase or decrease our margins>
What allocations should be made within the cost of our services for central expenditures, such as:
<ul>
<li>Audit & Compliance</li>
<li>Ethical Hacking</li>
<li>Technology Currency</li>
<li>Etc.</li>
</ul>

<h3>Installation</h3>
This is very easy to install. Basically download the tar file for both the application "mspcostmodel.tar" and the MySQL dumpfile "mspcostmodel.sql". Open/import the application tarfile into Netbeans (or your editor of choice) and edit in the config area the files to reflect your implementation: 

<ul>
<li>Database.php - will need to have the root password for MySQL (or an authorised user with privileges for the database)</li>
<li>Paths.php - reflect the paths to your version of the application</li>
<li>Constants.php - change the salt for the encryption of passwords</li>
</ul>

The final piece of installation is to create the database tables. The mspcostmodel.sql dumpfile is in the mspsqldump directory Open it in MySQL Workbench or use it from the command line. In either event add a new first line to the SQL file saying which database to use
as the first line of the file:

<code>use mspcostmodel;</code>

