------------------------------------------------
-- ������    :  zhx	
-- ����ʱ��  :  20110518
-- ����Ч��  :  ����ĵڶ��ν�������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

		{nLunarDamage= 262   * 0.98,nLunarDamageRand= 262   * 0.04, nCostMana= 186},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
   		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
   		123,											
   		0											
   		);
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	 ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        	"skill/����/�����ķ�_��ӽ���.lua", 
        	0
    );	
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	 ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        	"skill/����/�����ķ�_��ӽ���.lua", 
        	0
    );	
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,		-- ��������ģʽ
   		ATTRIBUTE_TYPE.ACCUMULATE,								-- ħ������
   		2,														-- ����ֵ1
   		0														-- ����ֵ2
   	);
--[[   	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        "skill/����/����_�߾�����.lua", 	-- ��Э��
        0
    );--]]
    
                                              --2011��4��18����ӽ����������Ľ���2��.�ź�

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
    --skill.SetNormalCoolDown(1, 123);	--����CD10��
	--skill.SetCheckCoolDown(1, 444);	
	--skill.nDamageToManaForParty = 51;	-- �˺���5%תΪ�������
	 skill.AddSlowCheckSelfBuff(1917,1,BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
		
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/10)*225;	-- �������ĵ�����
    --------------- ����������� ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius				= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 30 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 128; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    skill.nChannelInterval	= 64; 
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
   
end

function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com