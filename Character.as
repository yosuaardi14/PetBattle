package {

	public class Character {
		private var name:String = "";
		private var level: int = 1;
		private var hp: int = 100;
		private var maxHP: int = 100;
		private var cp: int = 0;
		private var maxCP: int = 100;
		private var agility: int = 10;
		private var critical: Number = 5;
		private var dodge: Number = 5;
		private var purify: Number = 5;
		private var buffArr: Object = {};
		private var debuffArr: Object = {};
		private var isDead: Boolean = false;
		private var petMc;
		private var iconMc;
		private var bodyMc;
		private var atb:int = 0;

		public function Character(statsObj: Object, petMc, iconMc, bodyMc) {
			this.name = statsObj["name"];
			this.level = statsObj["level"];
			this.hp = statsObj["hp"];
			this.maxHP = statsObj["maxHP"];
			this.cp = statsObj["cp"];
			this.maxCP = statsObj["maxCP"];
			this.agility = statsObj["agility"];
			this.critical = statsObj["critical"];
			this.dodge = statsObj["dodge"];
			this.purify = statsObj["purify"];
			this.buffArr = statsObj["buff"];
			this.debuffArr = statsObj["debuff"];
			this.isDead = statsObj["isDead"];
			this.petMc = petMc;
			this.iconMc = iconMc;
			this.bodyMc = bodyMc;
		}
	
		public function setHP(health:int){
			this.hp = health;
		}
		
		public function setCP(chakra:int){
			this.cp = chakra;
		}

		public function updateHP(health:int){
			this.hp += health;
		}
		
		public function updateCP(chakra:int){
			this.cp += chakra;
		}
		
		public function setBuffArr(buffArray:Object){
			this.buffArr = buffArray;
		}
	
		public function setDebuffArr(debuffArray:Object){
			this.debuffArr = debuffArray;
		}
	
		public function setIsDead(dead:Boolean){
			this.isDead = dead;
		}

		public function getName(){
			return this.name;
		}
		
		public function getLevel(){
			return this.level;
		}
		
		public function getHP(){
			if(this.hp < 0){
				this.hp = 0;
			}
			if(this.hp > this.maxHP){
				this.hp = this.maxHP;
			}
			return this.hp;
		}
		
		public function getCP(){
			if(this.cp < 0){
				this.cp = 0;
			}
			if(this.cp > this.maxCP){
				this.cp = this.maxCP;
			}
			return this.cp;
		}
	
		public function getMaxHP(){
			return this.maxHP;
		}
		
		public function getMaxCP(){
			return this.maxCP;
		}
		
		public function getAgility(){
			return this.agility;
		}
		
		public function getCritical(){
			return this.critical;
		}
		
		public function getDodge(){
			return this.dodge;
		}
		
		public function getPurify(){
			return this.purify;
		}
	
		public function getBuffArr(){
			return this.buffArr;
		}
	
		public function getDebuffArr(){
			return this.debuffArr;
		}
	
		public function getIsDead(){
			return this.isDead;
		}
	
		public function getBody(){
			return this.bodyMc;
		}
		
		public function getIcon(){
			return this.iconMc;
		}
	
		public function getPet(){
			return this.petMc;
		}

		public function getATB(){
			return this.atb;
		}

		public function resetATB():void{
			this.atb = this.atb % Constant.ATB_MAX_VALUE;
			// this.atb = 0;
		}

		public function updateATB(val):void{
			this.atb += this.agility * val;
		}

		public function isATBFull():Boolean{
			return this.atb >= Constant.ATB_MAX_VALUE;
		}
	}

}