---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/骑乘_普通.lua
-- 更新时间:	2013/6/5 19:44:11
-- 更新用户:	taoli
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/江湖/骑乘_鸵鸟.lua",
		0														
	);
    
	skill.AddSlowCheckSelfBuff(2587, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
	skill.AddSlowCheckSelfBuff(7682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 据点贸易任务中，默认禁止骑乘
	skill.AddSlowCheckSelfBuff(9509, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 青霄飞羽
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
	skill.nPrepareFrames = 48;										--吟唱帧数,16帧等于1秒
    
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
	if not item then		
		return false;
	end
	if player.nMoveState == MOVE_STATE.ON_FLOAT then
		if  item.dwIndex ~= 567 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(5, 5904), 10)
			return false
		end
	end	
	return nPreResult;		
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local nItem = player.GetEquippedHorse()
	if not nItem then
		return
	end	
	if player.nMoveState == MOVE_STATE.ON_FLOAT then
		if nItem.dwIndex == 567 then
			player.AddBuff(0, 99, 244, 3 )
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(5, 5904), 10)
			return
		end
	end		
	if nItem.dwIndex == 566 then
		player.AddBuff(0, 99, 244, 2 )
		player.AddBuff(0, 99, 5763, 1 )
	elseif nItem.dwIndex ~= 567 and nItem.dwIndex ~= 11105 and nItem.dwIndex ~= 11649 and nItem.dwIndex ~= 11770 then
		player.AddBuff(0, 99, 244, 1)
	end
	local HavePlayed = player.GetCustomInteger1(PLAYER_CUSTOM_VALUE.ONCE_PLAYL_HORSE_CG)
	if HavePlayed == 0 then
		RemoteCallToClient(player.dwID, "OnPlayerUIMovie", "ui/Video/Mashujiaoxue.avi", 6, false)
		player.SetCustomInteger1(PLAYER_CUSTOM_VALUE.ONCE_PLAYL_HORSE_CG, 1)
	end
	local item = player.GetEquippedHorse()
	if item.dwIndex == 601  then--虚空交椅、虚位交椅特别处理
		player.SetDynamicSkillGroup(45)
		player.AddBuff(0, 99, 5718, 1, 24 * 3600 * 3680)
	elseif item.dwIndex == 604 then
		player.SetDynamicSkillGroup(46)
		player.AddBuff(0, 99, 5718, 1, 24 * 3600 * 3680)
	end
	if player.GetSkillLevel(5666) == 1 then
		for i = 1, 5 do
			player.AddBuff(dwCharacterID, player.nLevel, 6121, 1, 1)
		end
	end
	if player.GetSkillLevel(6780) == 1 then
		--for i = 1, 5 do
		player.AddBuff(dwCharacterID, player.nLevel, 6331, 1, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 6333, 1, 1)
		--end
	end

	--马匹属性·监控处理
	player.AddBuff(dwCharacterID, player.nLevel, 8475, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com