<?php
/*
*
* Un petit script php qui renvoi differentes informations concernant l'utilisateurs.
* Et ceux, avec un peu de Skill JSON et d'objet pour aggrementer le tout ^^
* Il est interessant de savoir que l'on peut caster un objet en array, et recuperer ainsi un superbe tableau associatif
* dont raffole JSON.
*
*/
class API implements JsonSerializable {
	public $userIP;
	public $userHost;
	public $userPort;
	//public $userRemote;
	
	function __construct() {
		$this->userIP 		= $_SERVER["REMOTE_ADDR"];
		$this->userHost 	= gethostbyaddr($this->userIP);
		$this->userPort		= $_SERVER["REMOTE_PORT"];
		//$this->userRemote 	= $_SERVER["REMOTE_USER"];
	}
	
	public function jsonSerialize() {
		return (array)$this;
	}
}

$api = new API();
echo json_encode($api, JSON_PRETTY_PRINT);

?>
