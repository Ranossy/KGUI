---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���_��ͨ.lua
-- ����ʱ��:	2013/6/5 19:44:11
-- �����û�:	taoli
-- �ű�˵��:	 
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_�����¼�_֪����.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �����¼�
-- ��������  :  ֪����
-- ����Ч��  :  ֪���ε��¼����ܣ�����ʱ�������Թ������ͷ�һ���˺�����
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
		"skill/����/���_����.lua",
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
	skill.nPrepareFrames = 48;										--����֡��,16֡����1��
    
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
	if item.dwIndex == 601  then--��ս��Ρ���λ�����ر���
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

	--��ƥ���ԡ���ش���
	player.AddBuff(dwCharacterID, player.nLevel, 8475, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com