------------------------------------------------
-- 文件名    :  荻花圣殿_4号BOSS_卫戚梧_百步缠丝手.lua
-- 创建人    :  zhanghao	
-- 创建时间  :  2010-10-19
-- 技能名称  :  百步缠丝手
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 1 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 2 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 3 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 4 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 5 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 6 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 7 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 8 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 9 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 10 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 11 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 12 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 13 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 14 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 15 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 16 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 17 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},  	-- Level 18 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 19 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 20 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 21 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 22 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 23 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 24 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 25 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 26 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 27 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 28 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100},   	-- Level 29 Dash速度单位 点/帧
	{nDamage = 8000 *0.95, nDamageRand = 8000 *0.1, nDashSpeed = 100}   	-- Level 30 Dash速度单位 点/帧
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
	
	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_BUFF,
			2216,
			dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		2214,
		dwSkillLevel
	); 
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	  --skill.SetPublicCoolDown(16);		
	  --skill.SetNormalCoolDown(1, 336);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 32;
	skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 15 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
    --skill.nWeaponDamagePercent	= 0;
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	
end

--function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	
--
--	player.DelMultiGroupBuffByFunctionType(4);
--	player.DelMultiGroupBuffByFunctionType(6);
--	player.DelMultiGroupBuffByFunctionType(8);
--	player.DelMultiGroupBuffByFunctionType(7);
--	
--end
--
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com