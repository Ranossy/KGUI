---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/下马.lua
-- 更新时间:	2016/9/27 11:20:47
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

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--1
	--);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--2
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--3
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--4
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--5
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--6
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--7
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	--244,
	--8
	--);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/江湖/下马.lua",
		0
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	-- skill.nCostMana			= 0;

	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度
	skill.nAreaRadius = 25 * LENGTH_BASE;
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

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	--定格处理
	if target.IsHaveBuff(12024, 1) then
		target.DelBuff(12024, 1)
	end
	
	--下马中判断如果为副驾驶,并且主驾驶坐骑为驴车，则删除驴车主驾驶的动态技能栏
	local player = GetPlayer(target.dwControllerID)
	if player then
		--定格处理
		if player.IsHaveBuff(12024, 1) then
			player.DelBuff(12024, 1)
		end
		
		local item = player.GetEquippedHorse()
		if item and (item.dwIndex == 11770 or item.dwIndex == 13705 or item.dwIndex == 16785) then--驴车，羊车，马车
			player.SetDynamicSkillGroup(0)
		end
	end
	target.FollowStop()

	local item = target.GetEquippedHorse()
	if item then
		if item.dwIndex == 11105 or item.dwIndex == 11106 or item.dwIndex == 11649 or item.dwIndex == 11770 or item.dwIndex == 13705  or item.dwIndex == 13704 or item.dwIndex == 16785 or item.dwIndex == 20176 then
			target.SetDynamicSkillGroup(0)
		end

		if item.dwIndex == 13704 or item.dwIndex == 20176 or item.dwIndex == 21102 then--如果是船则触发表现
			if target.bOnHorse then
				target.DownHorse(1)
			end
		elseif item.dwIndex == 13784 then--如果是独轮车
			if target.bOnHorse then
				local buff1 = target.GetBuff(8989, 1)--定时
				if buff1 then
					target.DelBuff(8989, 1)
				end

				if target.nMoveState == MOVE_STATE.ON_FLY_JUMP then
					target.EndFlyJump()
					target.SetTurnRange(128, 128, 64, - 64)
				end

				target.DownHorse()
			end
		else
			if target.bOnHorse then
				target.DownHorse()
			end
		end
	else
		if target.bOnHorse then
			target.DownHorse()
		end
	end
	local buff = target.GetBuff(244, 0)
	if buff then
		target.DelBuff(244, buff.nLevel)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com