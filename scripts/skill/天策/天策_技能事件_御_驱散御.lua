---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����¼�_��_��ɢ��.lua
-- ����ʱ��:	2013/5/28 20:00:04
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
	{nBuffID = 360, nBuffLevel = 1}, -- Level 1
	{nBuffID = 360, nBuffLevel = 2}, -- Level 2
	{nBuffID = 360, nBuffLevel = 3}, -- Level 3
	{nBuffID = 360, nBuffLevel = 4}, -- Level 4
	{nBuffID = 360, nBuffLevel = 5}, -- Level 5
	{nBuffID = 360, nBuffLevel = 6}, -- Level 6

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;


	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		360,
		tSkillData[dwSkillLevel].nBuffLevel
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/���/���_�����¼�_��_��ɢ��.lua",
		0														
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
	if not player then
		return
	end
	local level = player.GetSkillLevel(2619)
	if level ~= 0 then
		player.AddBuff(0, 99, 4673, level)
	end

	--���ߣ�����ʧ��ü���
	if player.GetSkillLevel(5663) == 1 then
		--player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.05
		player.AddBuff(dwCharacterID, player.nLevel, 6120, 1, 1)
	end

	--��������Ϣʱ��2��
	if player.GetSkillLevel(14827) == 1 then
		player.CastSkill(14879, 1)
	end
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com