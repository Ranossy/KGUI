---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/空中冲刺.lua
-- 更新时间:	2015/8/18 15:37:07
-- 更新用户:	linjiajia2
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 34, nCostMana = 63, nDashSpeed = 120}, -- Level 1 Dash速度单位 点/帧

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

--	skill.AddAttribute(										--突解除锁足效果  2010.11.16 CBG
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
--		7,
--		9999
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/江湖/空中冲刺.lua",
		0
	);


	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 98);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 1 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 30 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

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

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
--	print("Apply*******************", dwCharacterID, player, dwSkillSrcID)
	player.AddBuff(0, 99, 9677, 3)
	local buff = player.GetBuff(9677, 3)
--	print("buff", buff)
	if not buff then
		return
	end
	buff.nCustomValue = dwCharacterID
--	player.SetTimer(2, "scripts/skill/江湖/空中冲刺.lua", 0, 0)
end

function UnApply(dwCharacterID)
end


function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
--	player.AddBuff(0, 99, 9518, 3)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com