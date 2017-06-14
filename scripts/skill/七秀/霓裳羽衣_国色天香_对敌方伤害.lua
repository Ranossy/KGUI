---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/霓裳羽衣_国色天香_对敌方伤害.lua
-- 更新时间:	2013/5/1 12:31:40
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  张豪	
-- 创建时间  :  2011-04-16
-- 技能效果  :  伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 305*0.95, 	nDamageRand = 305*0.1,  nCostMana = 42 },
	{nDamage = 330*0.95, 	nDamageRand = 330*0.1,  nCostMana = 42 },
	{nDamage = 355*0.95, 	nDamageRand = 355*0.1,  nCostMana = 42 },
	{nDamage = 380*0.95, 	nDamageRand = 380*0.1,  nCostMana = 42 },
	{nDamage = 405*0.95, 	nDamageRand = 405*0.1,  nCostMana = 42 },
	{nDamage = 430*0.95, 	nDamageRand = 430*0.1,  nCostMana = 42 },
	{nDamage = 455*0.95, 	nDamageRand = 455*0.1,  nCostMana = 42 },
	{nDamage = 480*0.95, 	nDamageRand = 480*0.1,  nCostMana = 42 },
	{nDamage = 505*0.95, 	nDamageRand = 505*0.1,  nCostMana = 42 },
	{nDamage = 530*0.95, 	nDamageRand = 530*0.1,  nCostMana = 42 },
	{nDamage = 555*0.95, 	nDamageRand = 555*0.1,  nCostMana = 42 },
	{nDamage = 580*0.95, 	nDamageRand = 580*0.1,  nCostMana = 42 },
	{nDamage = 605*0.95, 	nDamageRand = 605*0.1,  nCostMana = 42 },
	{nDamage = 630*0.95, 	nDamageRand = 630*0.1,  nCostMana = 42 },
	{nDamage = 655*0.95, 	nDamageRand = 655*0.1,  nCostMana = 42 },
	{nDamage = 680*0.95, 	nDamageRand = 680*0.1,  nCostMana = 42 },
	{nDamage = 705*0.95, 	nDamageRand = 705*0.1,  nCostMana = 42 },
	{nDamage = 730*0.95, 	nDamageRand = 730*0.1,  nCostMana = 42 },
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_ATTACK_POWER_PERCENT,
		-1024,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/10,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/10,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/霓裳羽衣_国色天香_对敌方伤害.lua",
		0
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
		
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana = tSkillData[dwSkillLevel].nCostMana;
	
	--------------- 设置杂项参数 ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- 技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- 技能施放最大半径
	skill.nAngleRange = 256; 									-- 施放角度
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- 吟唱帧数
	skill.nChannelInterval = 8; 			-- 通道技间隔时间 
	skill.nChannelFrame = 80;			-- 通道技持续时间，单位帧数 
	skill.nBulletVelocity = 0;					-- 子弹速度，单位 点/帧
    
	skill.nBreakRate = 1024;					--被打断的概率,默认1024表示一定被打断
    
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	if not player.GetBuff(1383, 2) and not player.GetBuff(8528,1) then
		player.DelBuff(409, nLevel + 7)
		player.DelBuff(409, nLevel + 14)	
		player.DelBuff(409, nLevel)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com