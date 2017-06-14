------------------------------------------------
-- 文件名    :  藏剑_秀水剑法_玉虹贯日.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-27
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  秀水剑法
-- 技能名称  :  玉虹贯日
-- 技能效果  :  玉带桥，长桥如玉虹贯日
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 20, nCostRage = 0 , nDashSpeed = 100},   	-- Level 1 Dash速度单位 点/帧
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
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		tSkillData[dwSkillLevel].nAddRage,
		0
	);

	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	ATTRIBUTE_TYPE.CALL_BUFF,
	1687,
	1
	);--添加换动作用隐藏Buff

 	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1736,
		1
	);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 332);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius	= 5* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 24 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
    skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
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
	--print("1111")
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local target = player.GetSelectCharacter()
	if not target then 
		return
	end
	player.TurnToCharacter(target.dwID)
	target.TurnToCharacter(player.dwID)
	player.AdjustPlayerDistance(target.dwID,128)
	return nPreResult;
end
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com