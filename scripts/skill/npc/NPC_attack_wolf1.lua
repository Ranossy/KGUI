--������Ե������� ǧ������ һͳ����
--�书����
--NPC����-��ͨ����
--����Ч����˵����NPC���ù������ܣ���cooldown���˺�һ�㡣
--�Ϸ� 2006-6-1

--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
    {nPhysicsAdd = 4,  nLevelUpExp = 100, nCostMana = 0, nCoolDownID1 = 7},
    {nPhysicsAdd = 15, nLevelUpExp = 100, nCostMana = 0, nCoolDownID1 = 7},
    {nPhysicsAdd = 25, nLevelUpExp = 100, nCostMana = 0, nCoolDownID1 = 7}
};


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
    local dwSkillLevel = skill.dwLevel;
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, 
        tSkillData[dwSkillLevel].nPhysicsAdd,
        0
    );
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, 
        0, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_POISON_DAMAGE, 
        0, 
        0
    );
    
    ----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	
	
    
    skill.SetNormalCoolDown(1, tSkillData[dwSkillLevel].nCoolDownID1);

	
    ----------------- ����������� ----------------------------------------
   
    --��������
    skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;    
    --��������
    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 2 * LENGTH_BASE;
    skill.nAngleRange       = 128; 
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nBreakRate        = 1000;
   
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