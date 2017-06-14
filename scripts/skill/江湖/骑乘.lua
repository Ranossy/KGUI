---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/骑乘.lua
-- 更新时间:	2016/9/27 11:13:22
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  纯阳_技能事件_知北游.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  技能事件
-- 技能名称  :  知北游
-- 技能效果  :  知北游的事件技能，被击时触发，对攻击者释放一个伤害技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------
--Include("scripts/Map/世界奇遇/世外奇人/include/世外奇人_data.lua")
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/江湖/骑乘.lua",
		0
	);
	skill.AddSlowCheckSelfBuff(2587, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
	skill.AddSlowCheckSelfBuff(4033, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 明教贪魔体无法上马
	skill.AddSlowCheckSelfBuff(7682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 据点贸易任务中，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 盾墙
	skill.AddSlowCheckSelfBuff(9509, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 青霄飞羽
	skill.AddSlowCheckSelfBuff(11151, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 霸刀不可被选中
	skill.AddSlowCheckSelfBuff(11152, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 霸刀不可被选中
	skill.AddSlowCheckSelfBuff(9469, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9470, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9471, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9520, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9521, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9522, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 名僧会的筹建公共任务，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(10802, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 双人秋千监控BUFF，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--霸刀大刀旋转
	skill.AddSlowCheckSelfBuff(10821, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 苍云特殊武器
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	-- skill.nCostMana			= 0;
	skill.SetCheckCoolDown(1, 444)
	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度
	skill.nAreaRadius = 25 * LENGTH_BASE;
	--skill.nPrepareFrames    = 48;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
	--判断玩家的状态，以判断是否可以发出技能
	local item = player.GetEquippedHorse()

	if item then
		if player.nMoveState ~= MOVE_STATE.ON_FLOAT and (nItem.dwIndex == 567 or nItem.dwIndex == 13704 or nItem.dwIndex == 20176 or nItem.dwIndex == 21102) then
			return SKILL_RESULT_CODE.MOVE_STATE_ERROR
		end

		if player.nMoveState == MOVE_STATE.ON_FLOAT and not (nItem.dwIndex == 567 or nItem.dwIndex == 13704 or nItem.dwIndex == 20176 or nItem.dwIndex == 21102) then
			return SKILL_RESULT_CODE.MOVE_STATE_ERROR
		end

		return nPreResult;
	else
		return false;
	end
end

function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local nItem = cPlayer.GetEquippedHorse()
	if not nItem then
		return
	end

	if cPlayer.bOnHorse then--如果是在马上，就下马
		cPlayer.CastSkill(54, 1)
		return
	end
	
	--定格处理取消
	if cPlayer.IsHaveBuff(12024, 1) then
		cPlayer.DelBuff(12024, 1)
	end
	
	if nItem.dwIndex == 11105 then
		cPlayer.CastSkill(8971, 1)
	elseif nItem.dwIndex == 11649 then
		cPlayer.CastSkill(8971, 1)
		cPlayer.CastSkill(9208, 1)
	elseif nItem.dwIndex == 11106 then
		cPlayer.CastSkill(8971, 1)
	elseif nItem.dwIndex == 11770 then
		cPlayer.CastSkill(9410, 1)
	elseif nItem.dwIndex == 13705 then--YC
		cPlayer.CastSkill(13838, 1)
	elseif nItem.dwIndex == 13704 then--HF
		cPlayer.CastSkill(13837, 1)
	elseif nItem.dwIndex == 11803 then
		cPlayer.CastSkill(10415, 1)
	elseif nItem.dwIndex == 13148 then--乌龟
		cPlayer.CastSkill(13617, 1)	--乌龟上马
	elseif nItem.dwIndex == 16785 then--MC
		cPlayer.CastSkill(15105, 1)
	elseif nItem.dwIndex == 16894 then--牦牛
		cPlayer.CastSkill(15495, 1)
	elseif nItem.dwIndex == 18305 then --夏日版驴车
		cPlayer.CastSkill(9410, 1)
	elseif nItem.dwIndex == 20176 then--红罗舸
		cPlayer.CastSkill(17077, 1)
	elseif nItem.dwIndex == 20265 then--双鹿雪橇
		cPlayer.CastSkill(17178, 1)
	elseif nItem.dwIndex == 20986 then--滑竿
		cPlayer.CastSkill(17507, 1)
	elseif nItem.dwIndex == 21076 then--龙舟·隐者
		cPlayer.CastSkill(17713, 1)
	elseif nItem.dwIndex == 21077 then--龙舟·游侠
		cPlayer.CastSkill(17714, 1)
	elseif nItem.dwIndex == 21102  then--画舫3号
		cPlayer.CastSkill(17797, 1)
	elseif nItem.dwIndex == 21073  then--狼车1号
		cPlayer.CastSkill(17798, 1)
	else
		cPlayer.CastSkill(4097, 1)
		cPlayer.CastSkill(4098, 1)
	end
	--添加世外奇人奇遇判断
--	g_QYShiWaiQiRen.Condition(cPlayer)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com