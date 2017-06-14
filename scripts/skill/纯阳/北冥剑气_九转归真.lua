---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/北冥剑气_九转归真.lua
-- 更新时间:	2013/6/28 16:14:38
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  王洋	
-- 创建时间  :  2007-12-11
-- 技能效果  :  运气于剑，用剑气将目标击飞。
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 50 * 0.95, nDamageRand = 50 * 0.1, nTime = 18, nCostMana = 379}, --level 1
	{ nDamageBase = 58 * 0.95, nDamageRand = 58 * 0.1, nTime = 18, nCostMana = 478}, --level 2
	{ nDamageBase = 66 * 0.95, nDamageRand = 66 * 0.1, nTime = 18, nCostMana = 544}, --level 3
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 3
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_REPULSED,
		tSkillData[dwSkillLevel].nTime, --滑步时间(帧)
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/北冥剑气_九转归真.lua", -- 连协技
		0
	);
	--skill.BindBuff(1, 452, 1);
	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 80);	--CD20s
	--skill.SetNormalCoolDown(2, 625);	--CD20s
	skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 625)
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 182;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 85; 									--施放角度120°
    
	skill.nPrepareFrames = 0;									--吟唱帧数,16帧等于1秒
    
	--skill.nBulletVelocity = 30;									--子弹速度,点/帧
 	
	skill.nDismountingRate = 1024;									--落马率为100%
 	
	skill.nDismountingRate = 1024;									--落马率为100%
    
	skill.nBreakRate = 1024;									--打断的概率,默认1024表示一定打断
    
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
	
	local target = player.GetSelectCharacter()
	if player.GetSkillLevel(6772) == 1 and target then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6311, 1, 1)
	end

	ModityCDToUI(player, 305, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com