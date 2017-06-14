---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/骑乘_轻功起跳.lua
-- 更新时间:	2015/6/3 15:41:11
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/HorseSkill/include/坐骑属性实现函数.lua")

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
		"skill/江湖/骑乘_轻功起跳.lua",
		0
	);

	-- skill.nCostMana			= 0;
	--skill.SetCheckCoolDown(1, 444)
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

function CanCast(player, nPreResult)
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	
	local item = cPlayer.GetEquippedHorse()
	if not item then
		return
	end

	if not cPlayer.bOnHorse then --不是坐骑中
		return
	end

	if not cPlayer.bSprintFlag then--不是轻功中
		return
	end

	if item.dwIndex == 13784 then
		cPlayer.SetTimer(1 * 16, "scripts/skill/江湖/骑乘_轻功起跳.lua", 0, 0)
	elseif item.dwIndex == 13790 then

		--------------------------------------------------------------检查【饱食·速翼】
		local nIndex_hs = 23
		local nID_hs = 30
		
		local tSkill = Horse_GetHorseSkillTable(cPlayer, nIndex_hs, nID_hs)
		if not tSkill then
			return
		end

		-----------------------------------------------------------------------------
		local nNumFull = Horse_GetBaoShiDuBiLi(cPlayer)
		if nNumFull >= tSkill.nFullPercen then
			--cPlayer.Talk(5)
			cPlayer.SetTimer(1.5 * 16, "scripts/skill/江湖/骑乘_轻功起跳.lua", 0, 0)
		else
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 5954), 4)
		end-------------------------
	end
end

function OnTimer(player, nParam1, nParam2)	
	local nItem = player.GetEquippedHorse()
	if not nItem then
		return
	end

	if nItem and nItem.dwIndex == 13790 then

		if player.bSprintFlag and player.bOnHorse and player.nJumpCount == 1 and player.nMoveState ~= MOVE_STATE.ON_FLY_JUMP and player.nMoveState == MOVE_STATE.ON_JUMP then
			if player.nPitchDirection > -5 then--俯仰角限定设置
				player.PitchTo(-5)
			end
			player.SetTurnRange(128, 128, -2, -20)
			player.FlyJump()
			player.AddBuff(0,99, 8992, 1, 5000)
		end
	end
	
	if nItem and nItem.dwIndex == 13784 then
		if player.bSprintFlag and player.bOnHorse and player.nJumpCount == 1 and player.nMoveState ~= MOVE_STATE.ON_FLY_JUMP and player.nMoveState == MOVE_STATE.ON_JUMP then
			if player.nPitchDirection > -5 then--俯仰角限定设置
				player.PitchTo(-5)
			end
			player.SetTurnRange(128, 128, -5, -20)
			player.FlyJump()
			player.AddBuff(0,99, 8992, 1, 5000)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com