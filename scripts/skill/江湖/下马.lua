---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����.lua
-- ����ʱ��:	2016/9/27 11:20:47
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

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};

--�����书���ܼ��������ֵ
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
		"skill/����/����.lua",
		0
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- ���ü������� ---------------------------------------------------------------------
	-- skill.nCostMana			= 0;

	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
	skill.nAreaRadius = 25 * LENGTH_BASE;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
	--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	--������
	if target.IsHaveBuff(12024, 1) then
		target.DelBuff(12024, 1)
	end
	
	--�������ж����Ϊ����ʻ,��������ʻ����Ϊ¿������ɾ��¿������ʻ�Ķ�̬������
	local player = GetPlayer(target.dwControllerID)
	if player then
		--������
		if player.IsHaveBuff(12024, 1) then
			player.DelBuff(12024, 1)
		end
		
		local item = player.GetEquippedHorse()
		if item and (item.dwIndex == 11770 or item.dwIndex == 13705 or item.dwIndex == 16785) then--¿�����򳵣���
			player.SetDynamicSkillGroup(0)
		end
	end
	target.FollowStop()

	local item = target.GetEquippedHorse()
	if item then
		if item.dwIndex == 11105 or item.dwIndex == 11106 or item.dwIndex == 11649 or item.dwIndex == 11770 or item.dwIndex == 13705  or item.dwIndex == 13704 or item.dwIndex == 16785 or item.dwIndex == 20176 then
			target.SetDynamicSkillGroup(0)
		end

		if item.dwIndex == 13704 or item.dwIndex == 20176 or item.dwIndex == 21102 then--����Ǵ��򴥷�����
			if target.bOnHorse then
				target.DownHorse(1)
			end
		elseif item.dwIndex == 13784 then--����Ƕ��ֳ�
			if target.bOnHorse then
				local buff1 = target.GetBuff(8989, 1)--��ʱ
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com