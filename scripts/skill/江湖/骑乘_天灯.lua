------------------------------------------------
-- 创建人   :  张豪	 
-- 创建时间	:  2014-3-13
-- 效果备注	:  默认的技能脚本
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
		"skill/江湖/骑乘_天灯.lua",
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
	--skill.nPrepareFrames = 48;										--吟唱帧数,16帧等于1秒
    
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
	local scene = player.GetScene()
	if not scene then
		return false;
	end
	if item.dwIndex == 11106 and item.dwIndex == 11649 then
		return nPreResult;
	end
	if player.bWanted == true then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 4805), 3)		
		return false;
	end
	if scene.dwMapID == 172 or scene.dwMapID == 25 or scene.dwMapID == 27 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 4806), 3)		
		return false;
	end
		
	if scene.nType == 1 and scene.dwMapID ~= 246 and scene.dwMapID ~= 258 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(7, 1121), 3)		
		return false;
	end
	
	if player.nMoveState == MOVE_STATE.ON_FLOAT then
		if item.dwIndex ~= 567 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(5, 5904), 10)
			return false
		end
	end	
	if player.nZ > scene.nHeightAvg *64 + 15000 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 4516), 1)
		return false;
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
	--player.SetPosition(player.nX, player.nY, player.nZ+2560)
	local nItem = player.GetEquippedHorse()
	if not nItem then
		return
	end
	if nItem.dwIndex == 11106 then
		player.AddBuff(0, 99, 244, 4)		--特殊的上马BUFF
		player.AddBuff(0, 99, 7698, 1)    --处理被击下马、重置镜头等等事件的BUFF
		player.PlayCameraAnimation(103, 0)
		player.AddBuff(0, 99, 7819, 1)
		player.AddBuff(0, 99, 7844, 1)	
	end
	if nItem.dwIndex == 11105 or nItem.dwIndex == 11649 then
		player.AddBuff(0, 99, 244, 4)		--特殊的上马BUFF
		player.AddBuff(0, 99, 7844, 1)
		player.AddBuff(0, 99, 7698, 1)    --处理被击下马、重置镜头等等事件的BUFF
		player.AddBuff(0, 99, 8178, 1)
		player.PlayCameraAnimation(103, 0)
	end

	--马匹属性·监控处理
	player.AddBuff(dwCharacterID, player.nLevel, 8475, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com