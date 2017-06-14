--������Ե������� ǧ������ һͳ����
--�书����
--NPC����-AOE����
--����Ч����˵������������Χһ����Χ�ͷ�AOE�˺�
--�º���
--08.01.24

----------------------------------------------------------�ְ��ְ��ָ��߰�----------------------------------------------------

tSkillData =
{
   {nCostMana = 15, nAPAdd = 2, nDamageRand= 0, nMaxRadius = 8, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 3, nDamageRand= 1,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 5, nDamageRand= 1,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 10, nDamageRand= 2,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
   {nCostMana = 15, nAPAdd = 16, nDamageRand= 3,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 20, nDamageRand= 4,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 26, nDamageRand= 5,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 30, nDamageRand= 6,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 36, nDamageRand= 7,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
   {nCostMana = 15, nAPAdd = 40, nDamageRand= 8,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 45, nDamageRand= 9,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 50, nDamageRand= 10,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 55, nDamageRand= 11,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 60, nDamageRand= 12,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 15, nAPAdd = 65, nDamageRand= 13,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024}
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����AOE�˺�---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, 
        tSkillData[dwSkillLevel].nAPAdd, --AOE�˺���û��AOE�˺�����ԭ��ֵ����0
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
	

--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     --skill.SetNormalCoolDown(1,7);
	
--������������-------
  
    --��������
    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    skill.nAreaRadius       = 20 * LENGTH_BASE;
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