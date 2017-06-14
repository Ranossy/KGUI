---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/世界奇遇/奇经恩仇录/传功.lua
-- 更新时间:	2016/12/25 18:50:06
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : zhangqi
-- 创建时间  : 2008-07-08
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 传功
-- 经脉效果  : 传功
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/世界奇遇/奇经恩仇录/include/data.lua")
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1022,
--		1
--	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1023,
--		1
--	);

--    skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
--        ATTRIBUTE_TYPE.TRANSMIT_TRAIN,
--        200,
--        tSkillData[dwSkillLevel].TransmitRate
--    );
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/世界奇遇/奇经恩仇录/传功.lua",
		0
	);

	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 64 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 192;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=

	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

function UnApply(dwCharacterID)
end
function CanCast(player, nPreResult, SkillTarget)    --判断玩家的状态，以判断是否可以发出技能
	if player.nCurrentTrainValue < 3000 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 2673), 4)
		player.SendSystemMessage(player.szName ..GetEditorString(2, 8065))
		return SKILL_RESULT_CODE.FAILED;
	end
	return SKILL_RESULT_CODE.SUCCESS;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwPlayerID)
	SkillApply_17218(dwCharacterID, dwPlayerID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com