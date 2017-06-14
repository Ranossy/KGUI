---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_君子风_断潮_技能事件_招架.lua
-- 更新时间:	2015/9/20 20:40:01
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_君子风_断潮_技能事件_招架.lua
-- 创建人    :  zhangqi
-- 创建时间  :  2010-03-2
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  君子风
-- 技能名称  :
-- 技能效果  :
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	if dwSkillLevel == 1 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/藏剑/藏剑_君子风_断潮_技能事件_招架.lua",
			0
		);
	end
	if dwSkillLevel == 2 then
		skill.BindBuff(1, 1722, 1)
	end

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	--	skill.nTargetCountLimit	= 1;
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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(5965) == 1 then
		player.ClearCDTime(383)
	end
	--]]
	local nRnd = Random(1, 10000)
	if player.GetSkillLevel(6545) == 1 then
		if nRnd <= 7000 then
			player.AddBuff(player.dwID, player.nLevel, 1722, 1)
			if player.GetSkillLevel(5965) == 1 then
				local nR = Random(1, 10000)
				if nR <= 5000 and not player.GetBuff(9924, 1) then
					player.AddBuff(player.dwID, player.nLevel, 9924, 1)
					player.ClearCDTime(383)
				end
			end
		end
	else
		if nRnd <= 3000 then
			player.AddBuff(player.dwID, player.nLevel, 1722, 1)
			if player.GetSkillLevel(5965) == 1 then
				local nR = Random(1, 10000)
				if nR <= 5000 and not player.GetBuff(9924, 1) then
					player.AddBuff(player.dwID, player.nLevel, 9924, 1)
					player.ClearCDTime(383)
				end
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com