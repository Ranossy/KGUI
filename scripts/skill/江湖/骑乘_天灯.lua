------------------------------------------------
-- ������   :  �ź�	 
-- ����ʱ��	:  2014-3-13
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

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
		"skill/����/���_���.lua",
		0														
	);
    
	skill.AddSlowCheckSelfBuff(2587, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	skill.AddSlowCheckSelfBuff(7682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- �ݵ�ó�������У�Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9509, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	-- skill.nCostMana			= 0;
	skill.SetCheckCoolDown(1, 444)
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

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
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
		player.AddBuff(0, 99, 244, 4)		--���������BUFF
		player.AddBuff(0, 99, 7698, 1)    --�������������þ�ͷ�ȵ��¼���BUFF
		player.PlayCameraAnimation(103, 0)
		player.AddBuff(0, 99, 7819, 1)
		player.AddBuff(0, 99, 7844, 1)	
	end
	if nItem.dwIndex == 11105 or nItem.dwIndex == 11649 then
		player.AddBuff(0, 99, 244, 4)		--���������BUFF
		player.AddBuff(0, 99, 7844, 1)
		player.AddBuff(0, 99, 7698, 1)    --�������������þ�ͷ�ȵ��¼���BUFF
		player.AddBuff(0, 99, 8178, 1)
		player.PlayCameraAnimation(103, 0)
	end

	--��ƥ���ԡ���ش���
	player.AddBuff(dwCharacterID, player.nLevel, 8475, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com