------------------------------------------------
-- �ļ���    :  ʦͽ��BUFF.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-12-3
-- ��;(ģ��):  �书����
-- �书����  :  
-- �书����  :  
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  ��������棡
----------------------�����ķָ���--------------------------


--------------�����Ǽ���----------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;

        skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        1592,		--���ڽ����ʦ����BUFF
        1			--Level
    );
        
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_MENTOR_BUFF, 
        1582,		--BUFFID
        1		--
    );

        skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        1584,		--ʩ�ŵ�hot
        1			--Level
    );
    
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/��/ʦͽ��BUFF.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 30 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�
    skill.nAreaRadius 		= 30 * LENGTH_BASE;							--���÷�Χ
    --����
	skill.bIsFormationSkill		= true
	skill.nLeastFormationPopulation= 2	
    skill.nFormationRange		= 30 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 12;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if player then
		if player.nLevel >= 70 then
			player.AddBuff(player.dwID,player.nLevel,1732,1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com