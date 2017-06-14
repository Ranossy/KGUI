---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���.lua
-- ����ʱ��:	2016/9/27 11:13:22
-- �����û�:	FENGMENGJIE
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
--Include("scripts/Map/��������/��������/include/��������_data.lua")
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
		"skill/����/���.lua",
		0
	);
	skill.AddSlowCheckSelfBuff(2587, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	skill.AddSlowCheckSelfBuff(4033, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����̰ħ���޷�����
	skill.AddSlowCheckSelfBuff(7682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- �ݵ�ó�������У�Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ǽ
	skill.AddSlowCheckSelfBuff(9509, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������
	skill.AddSlowCheckSelfBuff(11151, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- �Ե����ɱ�ѡ��
	skill.AddSlowCheckSelfBuff(11152, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- �Ե����ɱ�ѡ��
	skill.AddSlowCheckSelfBuff(9469, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9470, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9471, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9520, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9521, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9522, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��ɮ��ĳｨ��������Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(10802, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ˫����ǧ���BUFF��Ĭ�Ͻ�ֹ���
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--�Ե�����ת
	skill.AddSlowCheckSelfBuff(10821, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ������������
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
	--skill.nPrepareFrames    = 48;										--����֡��,16֡����1��

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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local nItem = cPlayer.GetEquippedHorse()
	if not nItem then
		return
	end

	if cPlayer.bOnHorse then--����������ϣ�������
		cPlayer.CastSkill(54, 1)
		return
	end
	
	--������ȡ��
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
	elseif nItem.dwIndex == 13148 then--�ڹ�
		cPlayer.CastSkill(13617, 1)	--�ڹ�����
	elseif nItem.dwIndex == 16785 then--MC
		cPlayer.CastSkill(15105, 1)
	elseif nItem.dwIndex == 16894 then--��ţ
		cPlayer.CastSkill(15495, 1)
	elseif nItem.dwIndex == 18305 then --���հ�¿��
		cPlayer.CastSkill(9410, 1)
	elseif nItem.dwIndex == 20176 then--������
		cPlayer.CastSkill(17077, 1)
	elseif nItem.dwIndex == 20265 then--˫¹ѩ��
		cPlayer.CastSkill(17178, 1)
	elseif nItem.dwIndex == 20986 then--����
		cPlayer.CastSkill(17507, 1)
	elseif nItem.dwIndex == 21076 then--���ۡ�����
		cPlayer.CastSkill(17713, 1)
	elseif nItem.dwIndex == 21077 then--���ۡ�����
		cPlayer.CastSkill(17714, 1)
	elseif nItem.dwIndex == 21102  then--����3��
		cPlayer.CastSkill(17797, 1)
	elseif nItem.dwIndex == 21073  then--�ǳ�1��
		cPlayer.CastSkill(17798, 1)
	else
		cPlayer.CastSkill(4097, 1)
		cPlayer.CastSkill(4098, 1)
	end
	--����������������ж�
--	g_QYShiWaiQiRen.Condition(cPlayer)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com