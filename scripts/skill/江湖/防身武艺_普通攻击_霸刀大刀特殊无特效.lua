---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_��ͨ����_�Ե�����������Ч.lua
-- ����ʱ��:	2016/9/18 23:39:36
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------

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
	skill.AddSlowCheckSelfBuff(11079, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL); ---����Ч
	skill.AddSlowCheckSelfBuff(10815, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL); ---�����
	--skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);
	--skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 590);

	----------------- ����������� ----------------------------------------

	
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE; --�����뾶��Ҳ���ǹ�������Ч����
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	--����֡��
	--skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	--skill.nBulletVelocity = 0;
	--����ϵĸ���
	  skill.nBreakRate = 1000;

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--if player.GetKungfuMount().dwSkillID == 10268 then
	--return false
	--end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com