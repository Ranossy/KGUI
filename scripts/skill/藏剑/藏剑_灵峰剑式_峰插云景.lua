------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_峰插云景.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-28
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  灵峰剑式
-- 技能名称  :  峰插云景
-- 技能效果  :  南北高峰插云中
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10 ,nDamage = 14*0.95, nDamageRand = 14*0.1, nTime = 22},   	-- Level 1 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 23*0.95, nDamageRand = 23*0.1, nTime = 22},   	-- Level 2 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 31*0.95, nDamageRand = 31*0.1, nTime = 22},   	-- Level 3 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 39*0.95, nDamageRand = 39*0.1, nTime = 22},   	-- Level 4 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 47*0.95, nDamageRand = 47*0.1, nTime = 22},   	-- Level 5 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 54*0.95, nDamageRand = 54*0.1, nTime = 22},   	-- Level 6 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 62*0.95, nDamageRand = 62*0.1, nTime = 22},   	-- Level 7 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 70*0.95, nDamageRand = 70*0.1, nTime = 22},   	-- Level 8 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 78*0.95, nDamageRand = 78*0.1, nTime = 22},   	-- Level 9 
	{nAddRage = 0, nCostRage = 10 ,nDamage = 86*0.95, nDamageRand = 86*0.1, nTime = 22},   	-- Level 10 
	
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

--硬直子技能
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1823,
		1
	);
	
	--skill.AddAttribute(
	--	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--	ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--	1740,
	--	1
--	);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 341);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
   	--skill.nChannelInterval	= 80;
	skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
    skill.nWeaponDamagePercent	= 1024;
	--skill.nPrepareFrames    = 24;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    ----------------- 打退打断落马相关 -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
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