---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���_�Ṧ����.lua
-- ����ʱ��:	2015/6/3 15:41:11
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/HorseSkill/include/��������ʵ�ֺ���.lua")

tSkillData =
{
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/���_�Ṧ����.lua",
		0
	);

	-- skill.nCostMana			= 0;
	--skill.SetCheckCoolDown(1, 444)
	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
	skill.nAreaRadius = 25 * LENGTH_BASE;

	--skill.nPrepareFrames = 48;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

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

	if not cPlayer.bOnHorse then --����������
		return
	end

	if not cPlayer.bSprintFlag then--�����Ṧ��
		return
	end

	if item.dwIndex == 13784 then
		cPlayer.SetTimer(1 * 16, "scripts/skill/����/���_�Ṧ����.lua", 0, 0)
	elseif item.dwIndex == 13790 then

		--------------------------------------------------------------��顾��ʳ������
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
			cPlayer.SetTimer(1.5 * 16, "scripts/skill/����/���_�Ṧ����.lua", 0, 0)
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
			if player.nPitchDirection > -5 then--�������޶�����
				player.PitchTo(-5)
			end
			player.SetTurnRange(128, 128, -2, -20)
			player.FlyJump()
			player.AddBuff(0,99, 8992, 1, 5000)
		end
	end
	
	if nItem and nItem.dwIndex == 13784 then
		if player.bSprintFlag and player.bOnHorse and player.nJumpCount == 1 and player.nMoveState ~= MOVE_STATE.ON_FLY_JUMP and player.nMoveState == MOVE_STATE.ON_JUMP then
			if player.nPitchDirection > -5 then--�������޶�����
				player.PitchTo(-5)
			end
			player.SetTurnRange(128, 128, -5, -20)
			player.FlyJump()
			player.AddBuff(0,99, 8992, 1, 5000)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com