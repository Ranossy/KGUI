---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/猿公剑法_剑灵寰宇.lua
-- 更新时间:	2013/5/31 1:43:50
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_猿公剑法_剑灵寰宇.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  外功
-- 武功套路  :  技能事件
-- 技能名称  :  剑灵寰宇
-- 技能效果  :  剑灵寰宇,AOE伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nLunarDamage = 369 * 0.95, nLunarDamageRand = 369 * 0.1, nCostMana = 110, nAreaRadius = 10},
	{nLunarDamage = 196 * 0.95, nLunarDamageRand = 196 * 0.1, nCostMana = 147, nAreaRadius = 10},
	{nLunarDamage = 230 * 0.95, nLunarDamageRand = 230 * 0.1, nCostMana = 205, nAreaRadius = 10},
	{nLunarDamage = 265 * 0.95, nLunarDamageRand = 265 * 0.1, nCostMana = 246, nAreaRadius = 10},
	{nLunarDamage = 300 * 0.95, nLunarDamageRand = 300 * 0.1, nCostMana = 287, nAreaRadius = 10},
	{nLunarDamage = 334 * 0.95, nLunarDamageRand = 334 * 0.1, nCostMana = 328, nAreaRadius = 10},
	{nLunarDamage = 369 * 0.95, nLunarDamageRand = 369 * 0.1, nCostMana = 369, nAreaRadius = 10}
};

tPit = 
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},

}   
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage/3 * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand/3 * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/猿公剑法_剑灵寰宇.lua", --属性值1
		0															--属性值2
	);
   	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD1.5秒
	skill.SetNormalCoolDown(1, 184);	--公共CD25秒
	skill.SetCheckCoolDown(1, 444);
	--skill.nDamageToManaForParty = 102
	
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
		
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 1095;	-- 技能消耗的内力
	--------------- 设置杂项参数 ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度
	skill.nAreaRadius = tSkillData[dwSkillLevel]. nAreaRadius * LENGTH_BASE;	-- 技能作用半径 
	skill.nTargetCountLimit = 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	skill.nChannelInterval = 100;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断
    
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	if player.GetSkillLevel(5867) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5793, 1, 1)
	end
	if player.GetSkillLevel(6564) == 1 then
		player.CastSkill(3016, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com