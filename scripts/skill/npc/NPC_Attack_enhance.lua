--������Ե������� ǧ������ һͳ����
--�书����
--NPC����-ֱ���˺�
--����Ч����˵����ֱ���˺�
--���� 2007-4-6

--------------�Ҳ��Ƿָ���----------------------------------------------------

tSkillData =
{
         {nCostMana = 15, nAPAdd = 200, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ����¹������¹                       ����
	 {nCostMana = 15, nAPAdd = 28, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  �б���������                                   ɥ�Ĳ���
	 {nCostMana = 15, nAPAdd = 20, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 15, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ������Ů��������Ů                        �ɵ�
	 {nCostMana = 15, nAPAdd = 23, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ��ʫ��                                                ��Ѩ��
	 {nCostMana = 15, nAPAdd = 23, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ��ʫ��                                                ��Ѩ��
	 {nCostMana = 15, nAPAdd = 23, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ��ʫ��                                                ��Ѩ��
	 {nCostMana = 15, nAPAdd = 23, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ��ʫ��                                                ��Ѩ��
	 {nCostMana = 15, nAPAdd = 23, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ��ʫ��                                                ��Ѩ��
	 {nCostMana = 15, nAPAdd = 23, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ��ʫ��                                                ��Ѩ��
     {nCostMana = 15, nAPAdd = 11, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 15, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ������                                        ʯ������
	 {nCostMana = 15, nAPAdd = 50, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC  ������                                                ��ҧ
	 {nCostMana = 15, nAPAdd = 50, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC �Ϲż��ޡ����Ǽ���                         ������Ϣ
	 {nCostMana = 15, nAPAdd = 10, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC ������­��������­                         ���ش��
	 {nCostMana = 15, nAPAdd = 117, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 128, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--��NPC ���������䵶�ķ���
	 {nCostMana = 0, nAPAdd = 100, nDamageRand = 5, nMinRadius = 0, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},--����NPC ����ʴ��ɢ 
	 
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--�����˺�---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, 
        tSkillData[dwSkillLevel].nAPAdd,
        0
    );
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, 
        0,
        0
    );
	
	if skill.dwLevel == 4 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        461,--����DEBUFF
        1
    );
	end
	
	if skill.dwLevel == 7 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        642,--������Ϣ��DOT
        1
    );
	end
	
	if skill.dwLevel == 8 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        464,--����DEBUFF
        1
    );
	end
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     --skill.SetNormalCoolDown(1,7);
	
--������������-------
  
    --��������
    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
	skill.nMinRadius        = tSkillData[dwSkillLevel].nMinRadius * LENGTH_BASE;
    skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --����֡��
    skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
    skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
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



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com