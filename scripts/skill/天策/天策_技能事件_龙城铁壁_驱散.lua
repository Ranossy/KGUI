---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����¼�_��������_��ɢ.lua
-- ����ʱ��:	2013/9/11 17:02:38
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�����¼�_��_��ɢ��.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-6-19
-- ��;(ģ��):  �书����
-- �书����  :  ���	
-- �书����  :  �⹦
-- �书��·  :  ��
-- ��������  :  �����¼�
-- ����Ч��  :  �������,��ɢ��Ч��,
------------------------------------------------

tSkillData = 
{

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		2778,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_�����¼�_��������_��ɢ.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

	-- skill.SetNormalCoolDown(1,7);
	
--������������-------
  
	--��������
--    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 20 * LENGTH_BASE;
	skill.nAngleRange = 256; 
	skill.nAreaRadius = 20 * LENGTH_BASE;
	--����֡��
	--  skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
	--�ӵ��ٶ�
	--  skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
	--����ϵĸ���
	-- skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
	return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nbuff = player.GetBuff(6810, 1)
	if nbuff then
		local targetID = nbuff.dwSkillSrcID
		local target = GetPlayer(targetID)
		if not target then
			return
		end
		target.CastSkill(14798, 1)
		ModityCDToUI(target, 2628, 0, 0)
	end
	
	if not player.GetBuff(2778, 1) then
		player.DelBuff(6810,1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com