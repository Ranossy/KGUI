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
		{nLunarDamage=63 /3,nLunarDamageRand=2},
		{nLunarDamage=104/3,nLunarDamageRand=3},
		{nLunarDamage=138/3,nLunarDamageRand=4},
		{nLunarDamage=173/3,nLunarDamageRand=5},
		{nLunarDamage=207/3,nLunarDamageRand=6},
		{nLunarDamage=242/3,nLunarDamageRand=6},
		{nLunarDamage=276/3,nLunarDamageRand=6},
		{nLunarDamage=311/3,nLunarDamageRand=6},
		{nLunarDamage=346/3,nLunarDamageRand=6},
		{nLunarDamage=380/3,nLunarDamageRand=6}
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
        tSkillData[dwSkillLevel].nLunarDamage, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nLunarDamageRand, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
        0, 
        0
    );	
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
		--������λ
		--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
		
		skill.nDamageToManaForParty = 51
		
		----------------- ���ü������� ---------------------------------------------------------------------
		-- skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    --------------- ����������� ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
		-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 128; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    skill.nChannelInterval	= 64; 
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com