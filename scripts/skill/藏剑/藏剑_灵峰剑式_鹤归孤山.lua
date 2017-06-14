---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_灵峰剑式_鹤归孤山.lua
-- 更新时间:	2013/8/21 11:15:09
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_鹤归孤山.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-28
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  灵峰剑式
-- 技能名称  :  鹤归孤山
-- 技能效果  :  《孤山志》道，以梅为妻，以鹤为子
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 20, nDamageBase = 20, nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 27, nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 34, nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 41, nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 48, nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 55, nDamageRand = 7}, -- Level 6 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 62, nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 69, nDamageRand = 8}, -- Level 8 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 76, nDamageRand = 9}, -- Level 9 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 83, nDamageRand = 9}, -- Level 10 
	{nAddRage = 0, nCostRage = 20, nDamageBase = 90, nDamageRand = 10}, -- Level 11
	{nAddRage = 0, nCostRage = 20, nDamageBase = 97, nDamageRand = 11}, -- Level 12
	{nAddRage = 0, nCostRage = 20, nDamageBase = 104, nDamageRand = 11}, -- Level 13
	{nAddRage = 0, nCostRage = 20, nDamageBase = 111, nDamageRand = 12}, -- Level 14
	{nAddRage = 0, nCostRage = 20, nDamageBase = 118, nDamageRand = 13}, -- Level 15
	{nAddRage = 0, nCostRage = 20, nDamageBase = 125, nDamageRand = 14}, -- Level 16
	{nAddRage = 0, nCostRage = 20, nDamageBase = 132, nDamageRand = 14}, -- Level 17
	{nAddRage = 0, nCostRage = 20, nDamageBase = 139, nDamageRand = 15}, -- Level 18

};           
             
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		12, --12frames,速度为80，距离则为15米
		80
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/藏剑/藏剑_灵峰剑式_鹤归孤山.lua", -- 属性值1
		0														-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1694,
		1
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1695,
		1
	);--添加换动作用隐藏Buff
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1953,
		1
	);--添加打断技能动作用隐藏Buff
	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	
	skill.SetNormalCoolDown(1, 337);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostRage = tSkillData[dwSkillLevel].nCostRage;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 80;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 0;
	--skill.nPrepareFrames    = 32;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	----------------- 打退打断落马相关 -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
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

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local i = 0
	if player.IsSkillRecipeActive(1569, 1) then
		i = i + 1
	end
	if player.IsSkillRecipeActive(1570, 1) then
		i = i + 1
	end
	if i ~= 0 then
		player.AddBuff(dwCharacterID, player.nLevel, 6540, i, 1)
	end
	
	ModityCDToUI(player, 1596, 0, 0)
end
--
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com