---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/阵法/苍云攻击阵法前三重.lua
-- 更新时间:	2014/10/20 9:17:24
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  郑海星
-- 创建时间  :  20110920
-- 用途(模块):  唐门阵法
----------------------华丽的分割线--------------------------

--------------以下是技能----------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		8402, --BUFFID
		1		--
	);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius = 30 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度
	skill.nAreaRadius = 30 * LENGTH_BASE;							--作用范围
	skill.bIsFormationSkill = true
	skill.nLeastFormationPopulation = 2
	skill.nFormationRange = 30 * LENGTH_BASE;	-- 结阵的范围
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒

	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧

	--skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断

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

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com