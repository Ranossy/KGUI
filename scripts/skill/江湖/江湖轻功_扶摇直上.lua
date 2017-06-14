---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/江湖轻功_扶摇直上.lua
-- 更新时间:	2017/3/19 16:22:15
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{},
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/江湖/江湖轻功_扶摇直上.lua",
		0
	);
	skill.AddSlowCheckSelfBuff(1900, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	--不能有扶摇直上
	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--苍云盾墙
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--霸刀大刀旋转

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1298,
		1
	); 				--清掉浩气盟草上飞的Buff

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1299,
		1
	); 				--清掉恶人谷草上飞的Buff

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1691,
		1
	); 				--清掉回龙岭瞬的Buff，20100522 失败的man修改

	-- 需求自身Buff--吞日月，禁轻功

	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 503);	--明教1秒GCD
	skill.SetNormalCoolDown(2, 204);
	skill.SetCheckCoolDown(1, 804);	--只检查不走的CD  苍云

	----------------- 设置杂项参数 ----------------------------------------

	--攻击半径，也就是攻击的有效距离
	--skill.nMaxRadius        = 4 * LENGTH_BASE;
	--skill.nAngleRange       = 64;
	--吟唱帧数
	skill.nPrepareFrames = 0;
	--子弹速度
	skill.nBulletVelocity = 0;
	--被打断的概率
	skill.nBreakRate = 1000;
	--硬直
	--skill.nStiffFrames		= 16

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--扶摇在这里添加
	local lv = player.GetSkillLevel(9002)
	if lv ~= 0 then
		player.AddBuff(player.dwID, player.nLevel, 208, lv, 30)
	end
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 1 then
		player.AcquireAchievement(704)
	end
	if skill.dwLevel == 4 then
		player.AcquireAchievement(73)
	end
	if skill.dwLevel == 11 then
		player.AcquireAchievement(74)
	end

	--满级新手指引任务
	local nQuestId = 13247
	local nQuestIndex = player.GetQuestIndex(nQuestId)
	local nQuestPhase = player.GetQuestPhase(nQuestId)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
		if skill.dwLevel == 11 then
			player.SetQuestValue(nQuestIndex, 0, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com