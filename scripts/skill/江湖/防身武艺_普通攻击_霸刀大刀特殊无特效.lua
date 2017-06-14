---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/防身武艺_普通攻击_霸刀大刀特殊无特效.lua
-- 更新时间:	2016/9/18 23:39:36
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddSlowCheckSelfBuff(11079, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL); ---无特效
	skill.AddSlowCheckSelfBuff(10815, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL); ---需求大刀
	--skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);
	--skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 590);

	----------------- 设置杂项参数 ----------------------------------------

	
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE; --攻击半径，也就是攻击的有效距离
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	--吟唱帧数
	--skill.nPrepareFrames = 0;
	--子弹速度
	--skill.nBulletVelocity = 0;
	--被打断的概率
	  skill.nBreakRate = 1000;

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	--if player.GetKungfuMount().dwSkillID == 10268 then
	--return false
	--end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com