---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/剑器浑脱_心鼓弦.lua
-- 更新时间:	2017/1/16 14:54:43
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  吴娟
-- 创建时间  :  2008-8-25
-- 技能效果  :  复活（能在战斗中使用）
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/skill调用/中立使用复活技能活动判断.lua")

tSkillData =
{
	{nReviveLife = 769, nReviveMana = 923, nCostMana = 92},
	{nReviveLife = 1111, nReviveMana = 1334, nCostMana = 133},
	{nReviveLife = 1368, nReviveMana = 1641, nCostMana = 164},
	{nReviveLife = 1624, nReviveMana = 1949, nCostMana = 194}
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 4

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.REVIVE,
		tSkillData[dwSkillLevel].nReviveLife, --复活后生命为50tSkillData[dwSkillLevel].nReviveLife
		tSkillData[dwSkillLevel].nReviveMana		--复活后内力为50tSkillData[dwSkillLevel].nReviveMana
	);

	--删除长歌救人标记buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9298,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		901,
		1
	);
	--[[  skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
        ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
        901,											--复活后生命为50tSkillData[dwSkillLevel].nReviveLife
        1											--复活后内力为50tSkillData[dwSkillLevel].nReviveMana
    );--]]

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD1.5秒
	skill.SetNormalCoolDown(1, 113);	--自身CD
	skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 590;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度

	skill.nPrepareFrames = 2.5 * GAME_FPS;						--吟唱帧数,16帧等于1秒
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	local nResult = CheckCamp(player)
	if not nResult then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 3567), 4)
		return SKILL_RESULT_CODE.FAILED
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	-- if skill.dwLevel == 1 then
	-- player.AcquireAchievement(52)
	-- end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
	-- player.AcquireAchievement(70)
	-- end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com