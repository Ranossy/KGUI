---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����ڳ�_��ͨ����.lua
-- ����ʱ��:	2013/9/6 11:37:55
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--������Ե������� ǧ������ һͳ����
--�书����
--NPC-��ͨ����
--����Ч����˵����NPC��ͨ��������
--����	2007-5-23

--------------����ķָ���-----------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.BindBuff(1, 6689, 1);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"Map/�����ڳ�/skill/�Թ��ұ��buff�ж�.lua",
		0														
	);
	skill.AddSlowCheckDestBuff(6750, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	
	----------------- ����������� ----------------------------------------
   
	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 4.0 * LENGTH_BASE;
	skill.nAngleRange = 128; 
   
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com