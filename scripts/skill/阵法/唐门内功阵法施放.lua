---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/�����ڹ���ʩ��.lua
-- ����ʱ��:	2013/5/7 21:49:45
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ֣����
-- ����ʱ��  :  20110920
-- ��;(ģ��):  ������

----------------------�����ķָ���--------------------------
tSkillData = 
{
        
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--	������ʱ�����BUFF
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DETACH_MULTI_GROUP_BUFF,
		23,
		100
	);
    
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		3303, --ʩ�ŵ�hot
		1		--Level
	);

	
	----------------- ����Cool down ---------------------------------------
	--skill.SetPublicCoolDown(16);
	--skill.SetPublicCoolDown(592);
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	
	skill.SetNormalCoolDown(1, 592);
	
	----------------- ����������� ----------------------------------------
	skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 30 * LENGTH_BASE;
	skill.nAngleRange = 256; 	--ȫ��λ
	--����֡��
	skill.nPrepareFrames = 0;	--˲��
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nBreakRate = 1000;
	--����
	skill.bIsFormationSkill = true
	--��ѡ��Χ ��ѡ��Χ��������������ж�--
	skill.nFormationRange = 20 * LENGTH_BASE	
	--��Χ��Ա����
	skill.nLeastFormationPopulation = 1			
      
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	local dwSkillLevel = skill.dwLevel;
	
	player.LearnSkill(3341);--�󷨵�1��
	player.LearnSkill(3342);--�󷨵�2��
	player.LearnSkill(3343);--�󷨵�3��
	player.LearnSkill(3344);--�󷨵�4��
	player.LearnSkill(3345);--�󷨵�5��
	player.LearnSkill(3346);--�󷨵�6��
	player.LearnSkill(3324);--�ر���
	
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com